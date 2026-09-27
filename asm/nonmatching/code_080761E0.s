	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080761E0
sub_080761E0: @ 0x080761E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807620C @ =0x0203E0FC
	ldr r2, _0807620C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_080716E0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807620C: .4byte 0x0203E0FC
