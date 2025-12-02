<ModalFrame
  id="modalUpdateOrder"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text id="modalTitle" value="## Update Order" verticalAlign="center" />
    <Button
      id="closeModalButton"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="run"
        params={{ map: { src: "modalUpdateOrder.setHidden(true);" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="inputName"
      label="Customer name"
      labelPosition="top"
      placeholder="Enter value"
      value="{{ (ordersTable.selectedSourceRow && ordersTable.selectedSourceRow.name) || '' }}"
    />
    <TextInput
      id="inputEmail"
      label="Customer email"
      labelPosition="top"
      placeholder="Enter value"
      value="{{ (ordersTable.selectedSourceRow && ordersTable.selectedSourceRow.email) || '' }}"
    />
    <Select
      id="inputDeliveryStatus"
      allowDeselect={true}
      data="{{ getDeliveryStatusesQuery.data.delivery_status }}"
      emptyMessage="No options"
      label="Delivery status"
      labelPosition="top"
      labels="{{ item }}"
      labelWidth={33}
      overlayMaxHeight={375}
      placeholder="Select a delivery status"
      showClear={true}
      showSelectionIndicator={true}
      value="{{ (ordersTable.selectedSourceRow && ordersTable.selectedSourceRow.delivery_status) || null }}"
      values="{{ item }}"
    >
      <Option id="00030" value="Option 1" />
      <Option id="00031" value="Option 2" />
      <Option id="00032" value="Option 3" />
    </Select>
  </Body>
  <Footer>
    <Button id="cancelButton" styleVariant="outline" text="Cancel">
      <Event
        event="click"
        method="run"
        params={{ map: { src: "modalUpdateOrder.setHidden(true);" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="saveButton" text="Save changes">
      <Event
        event="click"
        method="run"
        params={{ map: { src: "updateOrderQuery.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</ModalFrame>
