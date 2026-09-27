	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080719DC
sub_080719DC: @ 0x080719DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080146DC
	ldr r1, _08071A50 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08071A54 @ =0x030028AC
	ldr r1, _08071A54 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08071A58 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071A54 @ =0x030028AC
	ldr r1, _08071A54 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0x1f
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08071A5C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl sub_08071A60
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071A50: .4byte 0x02023C60
_08071A54: .4byte 0x030028AC
_08071A58: .4byte 0x0000FFE0
_08071A5C: .4byte 0x03002870
