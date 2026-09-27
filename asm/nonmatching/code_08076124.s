	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076124
sub_08076124: @ 0x08076124
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0807613C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08076140
	b _08076146
	.align 2, 0
_0807613C: .4byte 0x0203E0FC
_08076140:
	ldr r0, [r7]
	bl Proc_Break
_08076146:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
