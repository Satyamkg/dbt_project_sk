{% snapshot snapshot_weather %}

    {{
        config(
          target_database='raw_sk',
          target_schema='snapshots',
          unique_key="id",
          strategy='timestamp',
          updated_at='updated_at'
        )
    }}

select
    Date || '-' || Location as id,
    *
from 
    {{ ref('source_table_copy2') }}

{% endsnapshot %}