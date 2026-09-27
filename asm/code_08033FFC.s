	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08033FFC
sub_08033FFC: @ 0x08033FFC
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
	bne _08034018
	movs r2, #0x10
	mov sb, r2
_08034018:
	ldr r0, _0803407C @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r1, _08034080 @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08034084 @ =0x08B96D58
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
	bge _08034090
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08034088 @ =0x0200323C
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _0803408C @ =0x0200373C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	b _080340B2
	.align 2, 0
_0803407C: .4byte 0x02022C60
_08034080: .4byte 0x02023460
_08034084: .4byte 0x08B96D58
_08034088: .4byte 0x0200323C
_0803408C: .4byte 0x0200373C
_08034090:
	ldr r0, _080340D8 @ =0x0200323C
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
	ldr r0, _080340DC @ =0x0200373C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_thm
_080340B2:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080340CA
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_080340CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080340D8: .4byte 0x0200323C
_080340DC: .4byte 0x0200373C
