config.audit_with :paper_trail
  config.authorize_with :cancan

  config.actions do

     # root actions
    dashboard                     # mandatory

    # collection actions
    index                         # mandatory
    new
    export
    bulk_delete

    # member actions
    edit
    delete
  end