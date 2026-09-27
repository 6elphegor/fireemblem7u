	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTotalSupportCollection
GetTotalSupportCollection: @ 0x0809EC90
	push {r4, r5, lr}
	movs r0, #0
	bl GetTotalGlobalSupportValue
	adds r4, r0, #0
	bl GetTotalAverageSupportValue
	adds r5, r0, #0
	cmp r4, #0
	ble _0809ECB6
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	cmp r0, #0
	bne _0809ECB6
	movs r4, #1
	b _0809ECC2
_0809ECB6:
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r4, r0, #0
_0809ECC2:
	cmp r4, #0x64
	ble _0809ECC8
	movs r4, #0x64
_0809ECC8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
