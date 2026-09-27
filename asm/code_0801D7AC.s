	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyMenuProc_StarMenu
ConvoyMenuProc_StarMenu: @ 0x0801D7AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801D7D8 @ =0x02001F70
	bl GetConvoyItemCount
	strb r0, [r5]
	movs r0, #4
	bl ApplyIconPalettes
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D7E0
	ldrb r5, [r5]
	cmp r5, #0x63
	bhi _0801D7E0
	ldr r0, _0801D7DC @ =0x08B95968
	adds r1, r4, #0
	bl StartLockingMenu
	b _0801D7E8
	.align 2, 0
_0801D7D8: .4byte 0x02001F70
_0801D7DC: .4byte 0x08B95968
_0801D7E0:
	ldr r0, _0801D7F0 @ =0x08B95944
	adds r1, r4, #0
	bl StartLockingMenu
_0801D7E8:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801D7F0: .4byte 0x08B95944
