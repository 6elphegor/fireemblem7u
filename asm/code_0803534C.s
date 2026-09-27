	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803534C
sub_0803534C: @ 0x0803534C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r4, _08035390 @ =0x0203A97C
	ldrb r0, [r4, #6]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #7]
	lsls r1, r0, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r0, _08035394 @ =0x03004690
	ldr r0, [r0]
	adds r1, r5, #0
	bl UnitAddItem
	ldrb r1, [r4, #7]
	adds r0, r6, #0
	bl UnitRemoveItem
	adds r0, r5, #0
	mov r1, r8
	bl StartStoleItemPopup
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035390: .4byte 0x0203A97C
_08035394: .4byte 0x03004690
