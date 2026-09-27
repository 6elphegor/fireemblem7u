	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806693C
sub_0806693C: @ 0x0806693C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x1c]
	mov r8, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080669A2
	movs r0, #0x20
	mov r3, ip
	subs r0, r0, r3
	lsls r0, r0, #0x10
	mov sb, r0
_08066964:
	mov r3, ip
	subs r5, r2, #1
	cmp r3, #0
	beq _08066996
	movs r2, #1
	rsbs r2, r2, #0
	ldr r7, _080669B0 @ =0x00000FFF
	lsls r4, r6, #0xc
_08066974:
	ldrh r0, [r1]
	cmp r6, r2
	beq _08066982
	ands r0, r7
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066982:
	cmp r8, r2
	beq _0806698C
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0806698C:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08066974
_08066996:
	mov r2, sb
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08066964
_080669A2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080669B0: .4byte 0x00000FFF
