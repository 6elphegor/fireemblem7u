	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxHitQuake
NewEfxHitQuake: @ 0x0804EAA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r6, r2, #0
	ldr r0, _0804EAEC @ =0x02017740
	ldr r7, [r0]
	cmp r7, #0
	beq _0804EAC0
	b _0804EC5A
_0804EAC0:
	movs r4, #1
	str r4, [r0]
	ldr r0, _0804EAF0 @ =0x08B9AE34
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	mov r1, sb
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq _0804EB28
	cmp r6, #1
	bne _0804EAF8
	ldr r0, _0804EAF4 @ =0x081D7F22
	b _0804EB2A
	.align 2, 0
_0804EAEC: .4byte 0x02017740
_0804EAF0: .4byte 0x08B9AE34
_0804EAF4: .4byte 0x081D7F22
_0804EAF8:
	cmp r6, #2
	bne _0804EB04
	ldr r0, _0804EB00 @ =0x081D7F6C
	b _0804EB2A
	.align 2, 0
_0804EB00: .4byte 0x081D7F6C
_0804EB04:
	cmp r6, #3
	bne _0804EB10
	ldr r0, _0804EB0C @ =0x081D7FB6
	b _0804EB2A
	.align 2, 0
_0804EB0C: .4byte 0x081D7FB6
_0804EB10:
	cmp r6, #4
	bne _0804EB1C
	ldr r0, _0804EB18 @ =0x081D81D0
	b _0804EB2A
	.align 2, 0
_0804EB18: .4byte 0x081D81D0
_0804EB1C:
	cmp r6, #5
	bne _0804EB28
	ldr r0, _0804EB24 @ =0x081D8266
	b _0804EB2A
	.align 2, 0
_0804EB24: .4byte 0x081D8266
_0804EB28:
	ldr r0, _0804EB40 @ =0x081D7F00
_0804EB2A:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl CheckInEkrDragon
	adds r4, r0, #0
	cmp r4, #0
	beq _0804EB44
	movs r0, #0
	str r0, [r5, #0x64]
	b _0804EC5A
	.align 2, 0
_0804EB40: .4byte 0x081D7F00
_0804EB44:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804EB50
	str r4, [r5, #0x64]
	b _0804EC5A
_0804EB50:
	ldr r0, _0804EB60 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804EB64
	str r0, [r5, #0x64]
	b _0804EC5A
	.align 2, 0
_0804EB60: .4byte 0x0203E02C
_0804EB64:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804EB94 @ =0x0201FB00
	ldr r1, [r1]
	ldr r2, _0804EB98 @ =0x02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne _0804EBA0
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _0804EB9C @ =0x08B9CB84
	b _0804EBAA
	.align 2, 0
_0804EB94: .4byte 0x0201FB00
_0804EB98: .4byte 0x02000030
_0804EB9C: .4byte 0x08B9CB84
_0804EBA0:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _0804EBD0 @ =0x08B9CAF8
_0804EBAA:
	movs r1, #5
	bl AnimCreate
	adds r1, r0, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x36]
	subs r0, r2, r0
	strh r0, [r1, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r1, #4]
	ldr r0, _0804EBD4 @ =0x0201775C
	ldr r0, [r0]
	cmp r0, #1
	bne _0804EBD8
	movs r0, #0xd3
	lsls r0, r0, #6
	b _0804EBDC
	.align 2, 0
_0804EBD0: .4byte 0x08B9CAF8
_0804EBD4: .4byte 0x0201775C
_0804EBD8:
	movs r0, #0xf3
	lsls r0, r0, #6
_0804EBDC:
	strh r0, [r1, #8]
	str r1, [r5, #0x64]
	ldr r4, _0804EC68 @ =0x0200003C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804EC6C @ =0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r4, _0804EC70 @ =0x0203E024
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x39
	bne _0804EC20
	ldr r4, _0804EC74 @ =0x0200004C
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804EC78 @ =0x02016828
	movs r2, #8
	bl CpuFastSet
_0804EC20:
	ldr r4, _0804EC74 @ =0x0200004C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804EC7C @ =0x02022AC0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _0804EC80 @ =0x0203E02C
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08055468
	ldr r0, _0804EC84 @ =0x0201FB00
	ldr r0, [r0]
	bl sub_0804E6DC
_0804EC5A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EC68: .4byte 0x0200003C
_0804EC6C: .4byte 0x06011800
_0804EC70: .4byte 0x0203E024
_0804EC74: .4byte 0x0200004C
_0804EC78: .4byte 0x02016828
_0804EC7C: .4byte 0x02022AC0
_0804EC80: .4byte 0x0203E02C
_0804EC84: .4byte 0x0201FB00
