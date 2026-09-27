	.include "macro.inc"

	.syntax unified

	thumb_func_start ShouldDisplayDownArrow
ShouldDisplayDownArrow: @ 0x080B25F4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B2614 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldr r2, _080B2614 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	ldr r2, _080B2614 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	cmp r0, r2
	bge _080B2618
	movs r0, #1
	b _080B261C
	.align 2, 0
_080B2614: .4byte 0x08CE7298
_080B2618:
	movs r0, #0
	b _080B261C
_080B261C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
