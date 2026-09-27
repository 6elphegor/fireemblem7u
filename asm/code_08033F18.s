	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08033F18
sub_08033F18: @ 0x08033F18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	movs r1, #0x14
	mov sb, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08033F34
	movs r2, #0x10
	mov sb, r2
_08033F34:
	ldr r0, _08033F98 @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r1, _08033F9C @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08033FA0 @ =0x08B96D54
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge _08033FAC
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08033FA4 @ =0x0200323C
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _08033FA8 @ =0x0200373C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	b _08033FCE
	.align 2, 0
_08033F98: .4byte 0x02022C60
_08033F9C: .4byte 0x02023460
_08033FA0: .4byte 0x08B96D54
_08033FA4: .4byte 0x0200323C
_08033FA8: .4byte 0x0200373C
_08033FAC:
	ldr r0, _08033FF4 @ =0x0200323C
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _08033FF8 @ =0x0200373C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
_08033FCE:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08033FE6
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_08033FE6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033FF4: .4byte 0x0200323C
_08033FF8: .4byte 0x0200373C
