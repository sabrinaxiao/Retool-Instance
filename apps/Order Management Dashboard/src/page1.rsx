<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="7ee2a34c-d3ca-40d0-9ad1-d88d5c61ada5"
>
  <SqlQueryUnified
    id="getDeliveryStatusesQuery"
    notificationDuration={4.5}
    query={include("../lib/getDeliveryStatusesQuery.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="2820810d-7e8c-4708-bc5e-29bd5511f99b"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="getOrdersQuery"
    notificationDuration={4.5}
    query={include("../lib/getOrdersQuery.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="2820810d-7e8c-4708-bc5e-29bd5511f99b"
    showSuccessToaster={false}
  />
  <RetoolTableQuery
    id="updateOrderQuery"
    actionType="UPDATE_BY"
    changeset={
      '[{"key":"name","value":"{{ inputName.value }}"},{"key":"email","value":"{{ inputEmail.value }}"},{"key":"delivery_status","value":"{{ inputDeliveryStatus.value }}"}]'
    }
    filterBy={
      '[{"key":"id","operation":"=","value":"{{ ordersTable.selectedSourceRow.id }}"}]'
    }
    notificationDuration={4.5}
    resourceDisplayName="retool_db"
    resourceName="2820810d-7e8c-4708-bc5e-29bd5511f99b"
    showSuccessToaster={false}
    tableName="sabrina_customer_order_information"
  >
    <Event
      event="success"
      method="run"
      params={{
        map: {
          src: "getOrdersQuery.trigger(); modalUpdateOrder.setHidden(true);",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RetoolTableQuery>
  <JavascriptQuery
    id="updateOrderFilterGuard"
    notificationDuration={4.5}
    query={include("../lib/updateOrderFilterGuard.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Include src="./modalUpdateOrder.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Text
      id="pageTitle"
      value="# Order Management Dashboard"
      verticalAlign="center"
    />
    <Container
      id="filtersContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      style={{ map: { border: "transparent" } }}
    >
      <View id="00030" viewKey="View 1">
        <Select
          id="filterDeliveryStatus"
          allowDeselect={true}
          data="{{ getDeliveryStatusesQuery.data.delivery_status.map(s => ({ label: s, value: s })) }}"
          emptyMessage="No options"
          label="Delivery status"
          labelPosition="top"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="Select a delivery status"
          showClear={true}
          showSelectionIndicator={true}
          values="{{ item.value }}"
        >
          <Option id="00030" value="Option 1" />
          <Option id="00031" value="Option 2" />
          <Option id="00032" value="Option 3" />
        </Select>
        <TextInput
          id="searchInput"
          label="Search"
          labelPosition="top"
          placeholder="Search by name, email, or order ID"
        />
      </View>
    </Container>
    <Container
      id="ordersContainer"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      style={{ map: { border: "transparent" } }}
    >
      <View id="00030" viewKey="View 1">
        <Table
          id="ordersTable"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ formatDataAsArray(getOrdersQuery.data) }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No orders found."
          enableSaveActions={true}
          primaryKeyColumnId="715ed"
          rowHeight="medium"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="715ed"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="none"
            key="id"
            label="ID"
            position="center"
            referenceId="id"
            size={72}
            summaryAggregationMode="none"
          />
          <Column
            id="b52ef"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="name"
            label="Name"
            position="center"
            referenceId="name"
            size={160}
            summaryAggregationMode="none"
          />
          <Column
            id="8b14b"
            alignment="left"
            format="email"
            groupAggregationMode="none"
            key="email"
            label="Email"
            position="center"
            referenceId="email"
            size={220}
            summaryAggregationMode="none"
          />
          <Column
            id="7810a"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="delivery_status"
            label="Delivery status"
            position="center"
            referenceId="delivery_status"
            size={140}
            summaryAggregationMode="none"
          />
          <Column
            id="5ac4a"
            alignment="left"
            format="multilineString"
            groupAggregationMode="none"
            key="address"
            label="Address"
            position="center"
            referenceId="address"
            size={240}
            summaryAggregationMode="none"
          />
          <Column
            id="39441"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="product_id"
            label="Product ID"
            position="center"
            referenceId="product_id"
            size={120}
            summaryAggregationMode="none"
          />
          <Column
            id="99aaf"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true }}
            groupAggregationMode="none"
            key="amount_ordered"
            label="Amount ordered"
            position="center"
            referenceId="amount_ordered"
            size={120}
            summaryAggregationMode="none"
          />
          <Action id="c680b" icon="line/interface-edit-write-1" label="Update">
            <Event
              event="clickAction"
              method="run"
              params={{ map: { src: "modalUpdateOrder.setHidden(false);" } }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
          <ToolbarButton
            id="1a"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              pluginId="ordersTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="refresh"
              pluginId="ordersTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
  </Frame>
</Screen>
