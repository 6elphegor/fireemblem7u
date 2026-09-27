	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenu_Draw1stCommand
ItemMenu_Draw1stCommand: @ 0x0802367C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	ldr r0, _080236B8 @ =0x0202BBB8
	ldrh r0, [r0, #0x2c]
	bl GetItemName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080236BC @ =0x02022C60
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080236B8: .4byte 0x0202BBB8
_080236BC: .4byte 0x02022C60
