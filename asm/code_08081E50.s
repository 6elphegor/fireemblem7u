	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxPopulateAutoItem
HelpBoxPopulateAutoItem: @ 0x08081E50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldrh r5, [r0, #0x12]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r5, [r0]
	ldrh r0, [r0]
	bl GetHelpBoxItemInfoKind
	cmp r0, #3
	bne _08081E70
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	b _08081E7A
_08081E70:
	adds r0, r5, #0
	bl GetItemDescMsg
	adds r1, r4, #0
	adds r1, #0x4c
_08081E7A:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
