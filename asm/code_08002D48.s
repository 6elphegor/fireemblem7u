	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002D48
sub_08002D48: @ 0x08002D48
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	ldr r1, _08002DB8 @ =0x04000200
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08002DBC @ =0x04000132
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r3, _08002DC0 @ =0xFFFFC000
	adds r2, r1, r3
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08002DB8 @ =0x04000200
	ldr r1, _08002DB8 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002DC4 @ =0x0000DF7F
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08002DB8 @ =0x04000200
	ldr r1, _08002DB8 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r2, [r1]
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	bl SoundBiasReset
	svc #3
	bl SoundBiasSet
	ldr r0, _08002DB8 @ =0x04000200
	adds r1, r7, #4
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002DB8: .4byte 0x04000200
_08002DBC: .4byte 0x04000132
_08002DC0: .4byte 0xFFFFC000
_08002DC4: .4byte 0x0000DF7F
