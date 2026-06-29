{load_presentation_object filename="organizationalCategory" assign="objOrganization"}

{include file="`$smarty.const.FRONT_CURRENT_CLIENT`modules/organization/main.tpl" objOrganization=$objOrganization title=$smarty.const.ORGANIZATION_TITLE}