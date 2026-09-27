	.include "macro.inc"

	.syntax unified

	thumb_func_start PutXMapProgressPercent
PutXMapProgressPercent: @ 0x08042E70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #2
	adds r3, r6, #0
	bl SioDrawNumber
	ldr r3, _08042EB0 @ =0x081D5440
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08042EB4 @ =0x02022F7E
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042EB0: .4byte 0x081D5440
_08042EB4: .4byte 0x02022F7E
