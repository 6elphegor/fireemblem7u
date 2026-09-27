	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindSafestReachableLocation
AiFindSafestReachableLocation: @ 0x08036900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov sb, r1
	movs r0, #0xff
	mov sl, r0
	ldr r1, _08036944 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803694C
	ldr r4, _08036948 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _08036952
	.align 2, 0
_08036944: .4byte 0x0203A8EC
_08036948: .4byte 0x0202E3E4
_0803694C:
	adds r0, r5, #0
	bl RevertMapChange
_08036952:
	ldr r1, _080369D0 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _080369C6
_0803695E:
	ldr r1, _080369D0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r3, #0
	blt _080369C0
	lsls r4, r5, #2
	ldr r1, _080369D4 @ =0x0202E3E4
	mov ip, r1
	ldr r7, _080369D8 @ =0x0202E3DC
	ldr r6, _080369DC @ =0x0202BD48
	ldr r1, _080369E0 @ =0x0202E3F4
_0803697A:
	mov r2, ip
	ldr r0, [r2]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080369BA
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803699E
	ldrb r2, [r6]
	cmp r0, r2
	bne _080369BA
_0803699E:
	ldr r0, [r1]
	adds r2, r4, r0
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp sl, r0
	blo _080369BA
	mov r0, sb
	strh r3, [r0]
	strh r5, [r0, #2]
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	mov sl, r0
_080369BA:
	subs r3, #1
	cmp r3, #0
	bge _0803697A
_080369C0:
	mov r5, r8
	cmp r5, #0
	bge _0803695E
_080369C6:
	mov r1, sl
	cmp r1, #0xff
	bne _080369E4
	movs r0, #0
	b _080369E6
	.align 2, 0
_080369D0: .4byte 0x0202E3D8
_080369D4: .4byte 0x0202E3E4
_080369D8: .4byte 0x0202E3DC
_080369DC: .4byte 0x0202BD48
_080369E0: .4byte 0x0202E3F4
_080369E4:
	movs r0, #1
_080369E6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
