	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072898
sub_08072898: @ 0x08072898
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080728E4 @ =0x08C9DB64
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	ldr r1, _080728E8 @ =0x0203A85C
	ldrb r2, [r1, #0x13]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080728EC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r1, _080728E8 @ =0x0203A85C
	ldrb r2, [r1, #0x14]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldr r2, _080728EC @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080728E4: .4byte 0x08C9DB64
_080728E8: .4byte 0x0203A85C
_080728EC: .4byte 0x0202BBB8
