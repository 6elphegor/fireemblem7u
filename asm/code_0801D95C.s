	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuCommand_DrawExtraItem
MenuCommand_DrawExtraItem: @ 0x0801D95C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0801D998 @ =0x0202BBB8
	ldrh r6, [r0, #0x2c]
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	movs r0, #0x2c
	ldrsh r2, [r4, r0]
	lsls r2, r2, #5
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _0801D99C @ =0x02022C60
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawItemMenuLineNoColor
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801D998: .4byte 0x0202BBB8
_0801D99C: .4byte 0x02022C60
