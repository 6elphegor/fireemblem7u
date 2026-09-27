	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075638
sub_08075638: @ 0x08075638
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075648 @ =0x0203E0FC
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _08075650
	ldr r0, _0807564C @ =0x08C9DF8C
	b _0807565C
	.align 2, 0
_08075648: .4byte 0x0203E0FC
_0807564C: .4byte 0x08C9DF8C
_08075650:
	ldr r0, _08075658 @ =0x0203E0FC
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	b _0807565C
	.align 2, 0
_08075658: .4byte 0x0203E0FC
_0807565C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
