// Documentation:
//   Provides safe defaults to avoid null access in updateOrderQuery filterBy.
//   Returns the selected order's ID or null if no order is selected.
// Returns:
//   {
//     id: number | null // The ID of the selected order, or null if none selected
//   }

const selected = ordersTable.selectedSourceRow || {};
return { id: selected.id || null };