# PricePilot AI - Dedicated Inventory Management Service
from typing import List, Dict, Optional

class InventoryItem:
    def __init__(self, item_id: int, name: str, category: str, stock: int, cost: float, price: float, daily_demand: float):
        self.item_id = item_id
        self.name = name
        self.category = category
        self.stock = stock
        self.cost = cost
        self.price = price
        self.daily_demand = daily_demand

    @property
    def is_critical(self) -> bool:
        return self.stock < 50

    @property
    def is_low_stock(self) -> bool:
        return self.stock < 100

    @property
    def days_of_inventory(self) -> float:
        return round(self.stock / max(self.daily_demand, 1.0), 1)

    def restock(self, units: int) -> int:
        self.stock += units
        return self.stock

class InventoryService:
    def __init__(self):
        self.items: Dict[int, InventoryItem] = {}

    def add_item(self, item: InventoryItem):
        self.items[item.item_id] = item

    def get_critical_items(self) -> List[InventoryItem]:
        return [i for i in self.items.values() if i.is_low_stock]

    def renew_stock(self, item_id: int, units: int) -> Optional[int]:
        if item_id in self.items:
            return self.items[item_id].restock(units)
        return None
