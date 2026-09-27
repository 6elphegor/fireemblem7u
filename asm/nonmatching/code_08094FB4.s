	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08094FB4
sub_08094FB4: @ 0x08094FB4
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #2
	bl PutUnitSpriteForClassId
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r0}
	bx r0
