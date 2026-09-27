	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809BE14
sub_0809BE14: @ 0x0809BE14
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809BE36
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	b _0809BE48
_0809BE36:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
_0809BE48:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
