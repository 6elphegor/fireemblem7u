	.include "macro.inc"

	.syntax unified

	thumb_func_start AiRandomMove
AiRandomMove: @ 0x08035C70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _08035C94 @ =0x03004690
	ldr r0, [r0]
	bl RevertMapChange
	ldr r3, _08035C98 @ =0x0000FFFF
	ldr r0, _08035C9C @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08035D0A
	.align 2, 0
_08035C94: .4byte 0x03004690
_08035C98: .4byte 0x0000FFFF
_08035C9C: .4byte 0x0202E3D8
_08035CA0:
	ldr r0, _08035D40 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	lsls r7, r1, #0x10
	cmp r4, #0
	blt _08035D06
	adds r2, r7, #0
	asrs r6, r7, #0xe
_08035CB6:
	ldr r0, _08035D44 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	asrs r1, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035CF8
	ldr r0, _08035D48 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035CF8
	movs r0, #0x80
	lsls r0, r0, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	cmp r0, r8
	blo _08035CF8
	mov r8, r0
	lsrs r3, r4, #0x10
	lsrs r1, r2, #0x10
	mov sb, r1
_08035CF8:
	lsls r0, r5, #0x10
	ldr r1, _08035D4C @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	cmp r4, #0
	bge _08035CB6
_08035D06:
	ldr r1, _08035D4C @ =0xFFFF0000
	adds r0, r7, r1
_08035D0A:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08035CA0
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08035D30
	mov r0, sb
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl AiSetDecision
_08035D30:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035D40: .4byte 0x0202E3D8
_08035D44: .4byte 0x0202E3E4
_08035D48: .4byte 0x0202E3DC
_08035D4C: .4byte 0xFFFF0000
