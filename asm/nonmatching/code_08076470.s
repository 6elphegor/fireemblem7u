	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076470
sub_08076470: @ 0x08076470
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080764AC @ =0x0203E0FC
	ldr r2, _080764AC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r2, _080764AC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r3, _080764AC @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x61
	ldrb r2, [r3]
	bl sub_080726C0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080764AC: .4byte 0x0203E0FC
