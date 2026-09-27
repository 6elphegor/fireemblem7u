	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF554
sub_080AF554: @ 0x080AF554
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080AF580 @ =0x08CE5F10
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2e
	strb r5, [r1]
	strh r6, [r0, #0x30]
	mov r1, r8
	strh r1, [r0, #0x2c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080AF580: .4byte 0x08CE5F10
