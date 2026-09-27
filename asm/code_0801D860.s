	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyMenuProc_ExecBootlegPopup
ConvoyMenuProc_ExecBootlegPopup: @ 0x0801D860
	push {r4, lr}
	adds r4, r0, #0
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D89C
	ldr r0, _0801D884 @ =0x02001F70
	ldrb r0, [r0]
	cmp r0, #0x63
	bhi _0801D88C
	ldr r0, _0801D888 @ =0x0203A85C
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl NewPopup2_SendItem
	b _0801D8A6
	.align 2, 0
_0801D884: .4byte 0x02001F70
_0801D888: .4byte 0x0203A85C
_0801D88C:
	ldr r0, _0801D898 @ =0x0203A85C
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl NewPopup2_DropItem
	b _0801D8A6
	.align 2, 0
_0801D898: .4byte 0x0203A85C
_0801D89C:
	ldr r0, _0801D8AC @ =0x0203A85C
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl NewPopup2_DropItem
_0801D8A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D8AC: .4byte 0x0203A85C
