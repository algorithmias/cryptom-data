---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

## Welcome!
<details>
    <summary>Moments</summary>
    <ul>
        <li>{{ "moments/" | echo_folder }}</li>
        <li>{{ "moments/" | list_files }}</li>
        <li>{{ "moments/" | list_files: "*" }}</li>
        <li>{{ "moments/" | list_folders }}</li>
    </ul>
</details>

<details>
    <summary>Signals</summary>
    <ul>
        <li>{{ "signals/" | echo_folder }}</li>
        <li>{{ "signals/" | list_files }}</li>
        <li>{{ "signals/" | list_files: "*" }}</li>
        <li>{{ "signals/" | list_folders }}</li>
    </ul>
</details>

<details>
    <summary>Trendlines</summary>
    <ul>
        <li>{{ "trendlines/" | echo_folder }}</li>
        <li>{{ "trendlines/" | list_files }}</li>
        <li>{{ "trendlines/" | list_files: "*" }}</li>
        <li>{{ "trendlines/" | list_folders }}</li>
    </ul>
</details>