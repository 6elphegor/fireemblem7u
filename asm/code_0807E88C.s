	.include "macro.inc"

	.syntax unified

	thumb_func_start ReputFireDragonSprite
ReputFireDragonSprite: @ 0x0807E88C
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	bl StartEventDragonsSpriteDeamon
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
