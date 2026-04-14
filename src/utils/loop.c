// ********************************
// *** Author: Reymon Dev       ***
// *** File:   init.c           ***
// *** Date:   20/03/2026       ***
// *** Update: 26/03/2026       ***
// *** License: AGPL-3-or-later ***
// ********************************

// **************************
// *** Standard Libraries ***
// **************************

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

// ************************
// *** Reymon Libraries ***
// ************************

#include <reymon/reydb.h>
#include <executable/example.h>

// ***********************
// *** Local Variables ***
// ***********************

static reydb_key key = ZERO;

// **********************
// *** Logic Function ***
// **********************

reydb_state REYDB_LOOP() {

	puts("1) Agregar Registro");
	puts("2) Remover Registro");
	puts("3) Actualizar Registro");
	puts("5) Buscar Registro");
	puts("6) Cambiar Registro");

	printf("Ingresa la operación a realizar: ");
	reydb_scanf = scanf("%s", reydb_accept);
	puts("");
	puts("");

	for (int i = ZERO; i < 64; i++) {
		
		char c = reydb_accept[i];
		reydb_accept[i] = toupper(c);

	}

	if (strcmp(reydb_accept, "AGREGAR") == 0) {
	
		REYDB_ADD(&reydb_employe[key]);
		puts("");
		puts("");

		return REYDB_CONTINUE;
	
	} else if (strcmp(reydb_accept, "REMOVER") == 0) {

		REYDB_REMOVE(&reydb_employe[key]);
		puts("");
		puts("");

		return REYDB_CONTINUE;

	} else if (strcmp(reydb_accept, "ACTUALIZAR") == 0) {

		printf("Ingresa el nuevo salario: ");
		reydb_scanf = scanf("%s", reydb_employe[key].salary);

		printf("Ingresa la nueva divisa base: ");
		reydb_scanf = scanf("%s", reydb_employe[key].currency);

		REYDB_REWRITE(&reydb_employe[key]);

		puts("");
		puts("");

		return REYDB_CONTINUE;

	} else if (strcmp(reydb_accept, "BUSCAR") == 0) {

		employe_t* employe = NULL;

		for (reydb_key k = ZERO; k < 10; k++ ) {

			employe = (employe_t*) REYDB_SEARCH(k);

			if (employe != NULL) {

				printf("Llave Primaria: %zu\n"
				   	"Sueldo: %s\n"
				   	"Divisa: %s\n\n",
				   	employe -> key,
				   	employe -> salary,
				 	employe -> currency
				);
			}

		}

		puts("");
		puts("");

		return REYDB_CONTINUE;

	} else if (strcmp(reydb_accept, "CAMBIAR") == 0) {

		printf("Ingrese la llave del nuevo registro: ");
		reydb_scanf = scanf("%zu", &key);

		if (key <= 10) {
			
			puts("");
			puts("");

			reydb_employe[key].key = key;

			REYDB_REWRITE(&reydb_employe[key]);
		
		} else puts("El registro no existe");

		return REYDB_CONTINUE;

	} else if (strcmp(reydb_accept, "SALIR") == 0)

		return REYDB_BREAK;

	else {
		
		puts("");
		puts("");

		return REYDB_CONTINUE;
	
	}

}