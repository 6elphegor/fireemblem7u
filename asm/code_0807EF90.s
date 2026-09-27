	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EF90
sub_0807EF90: @ 0x0807EF90
	push {r4, lr}
	bl GetPartyTotalGoldValue
	adds r4, r0, #0
	ldr r0, _0807EFB4 @ =0x0000752F
	cmp r4, r0
	ble _0807EFBC
	movs r0, #0x85
	bl SetFlag
	ldr r0, _0807EFB8 @ =0x000080E7
	cmp r4, r0
	ble _0807EFC8
	movs r0, #0x84
	bl SetFlag
	b _0807EFC8
	.align 2, 0
_0807EFB4: .4byte 0x0000752F
_0807EFB8: .4byte 0x000080E7
_0807EFBC:
	ldr r0, _0807EFD0 @ =0x00004E1F
	cmp r4, r0
	ble _0807EFC8
	movs r0, #0x84
	bl SetFlag
_0807EFC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFD0: .4byte 0x00004E1F
