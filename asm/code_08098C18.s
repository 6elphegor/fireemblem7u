	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098C18
sub_08098C18: @ 0x08098C18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08098C6C @ =0x02022EA4
	ldr r1, _08098C70 @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl WmSell_DrawItemGoldValue
	movs r0, #0
	bl DisableUiCursorHand
	ldr r0, _08098C74 @ =sub_0809871C
	bl GetParallelWorker
	bl Proc_End
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	adds r1, r4, #0
	bl sub_080985D4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098C6C: .4byte 0x02022EA4
_08098C70: .4byte 0x02012B78
_08098C74: .4byte sub_0809871C
