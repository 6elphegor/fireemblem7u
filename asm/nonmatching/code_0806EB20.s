	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_PlayStealSe
Manim_PlayStealSe: @ 0x0806EB20
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806EB40 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806EB3A
	movs r0, #0xa0
	bl m4aSongNumStart
_0806EB3A:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB40: .4byte 0x0202BBF8
