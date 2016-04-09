password = notforyou2

all: tests

.PHONY: init
init: init.sql
	mysql --user=root --password=$(password) < $<

.PHONY: populate
populate: init
	for i in customer rental_history reservation equipment_type reservation_item rental_contract equipment rental_item accessory equipped_with supplier order line_item_equipment line_item_accessory; \
		do echo -e "\e[1mPopulate $$i Output\e[0m:"; \
		mysql --user=root --password=$(password) < ./values/$$i.sql; \
	done

.PHONY: query
query: populate  
	for i in $$(ls ./queries/); \
		do echo -e "\e[1mQuery $$i Output\e[0m:"; \
		mysql --user=root --password=$(password) < ./queries/$$i; \
	done

.PHONY: procedures
procedures: populate
	for i in $$(ls ./procedures/); \
		do echo -e "\e[1mCreate Procedure $$i Output\e[0m:"; \
		mysql --user=root --password=$(password) < ./procedures/$$i; \
	done

.PHONY: tests
tests: procedures
	for i in $$(ls ./tests/); \
		do echo -e "\e[1mTest $$i Output\e[0m:"; \
		mysql --user=root --password=$(password) < ./tests/$$i; \
	done
