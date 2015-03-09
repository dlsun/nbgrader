{%- extends 'gradebook.tpl' -%}

{%- block breadcrumb -%}
<li><a href="/students">Students</a></li>
<li><a href="/students/{{ student.id }}">{{ student.id }}</a></li>
<li class="active">{{ assignment_id }}</li>
{%- endblock -%}

{%- block body -%}
<div class="panel-body">
  The following table lists all the notebooks for the assignment "{{ assignment_id }}" by {{ student.last_name }}, {{ student.first_name }}.
  You can grade a notebook by clicking on its ID.
</div>
{%- endblock -%}

{%- block table -%}
<thead>
  <tr>
    <th>Notebook ID</th>
    <th class="center">Overall Score</th>
    <th class="center">Code Score</th>
    <th class="center">Written Score</th>
    <th class="center">Manual grade?</th>
  </tr>
</thead>
<tbody>
  {%- for submission in submissions -%}
  <tr>
    <td>
      <a href="/submissions/{{ submission.id }}">
        {{ submission.name }}
      </a>
    </td>
    <td class="center">{{ submission.score | float | round(2) }} / {{ submission.max_score | float | round(2) }}</td>
    <td class="center">{{ submission.code_score | float | round(2) }} / {{ submission.max_code_score | float | round(2) }}</td>
    <td class="center">{{ submission.written_score | float | round(2) }} / {{ submission.max_written_score | float | round(2) }}</td>
    <td class="center">
      {%- if submission.needs_manual_grade -%}
      <span class="glyphicon glyphicon-ok"></span>
      {%- endif -%}
    </td>
  </tr>
  {%- endfor -%}
</tbody>
{%- endblock -%}
