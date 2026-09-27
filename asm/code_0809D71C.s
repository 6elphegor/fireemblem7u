	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D71C
sub_0809D71C: @ 0x0809D71C
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D73A
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #0x30
	movs r1, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809D74C
_0809D73A:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x30
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809D74C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
