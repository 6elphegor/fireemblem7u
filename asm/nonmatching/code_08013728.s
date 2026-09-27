	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteFadedPaletteFromArchive
WriteFadedPaletteFromArchive: @ 0x08013728
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	str r2, [sp]
	mov sl, r3
	bl SetPalFadeStClkEnd1
	mov r0, r8
	bl SetPalFadeStClkEnd2
	ldr r0, [sp]
	bl SetPalFadeStClkEnd3
	bl GetPalFadeSt
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r7, r0
	ble _080137AC
	ldr r0, _080137A4 @ =0xFFFFFF00
	adds r7, r7, r0
	movs r5, #0
	mov ip, r5
_08013762:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08013798
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r1, _080137A8 @ =0x02022860
	adds r2, r0, r1
_0801377C:
	adds r1, r6, #0
	ldrh r0, [r3]
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	ands r1, r6
	strh r1, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _0801377C
_08013798:
	movs r1, #0x30
	add ip, r1
	adds r5, #1
	cmp r5, #0x1f
	ble _08013762
	b _080137EC
	.align 2, 0
_080137A4: .4byte 0xFFFFFF00
_080137A8: .4byte 0x02022860
_080137AC:
	movs r5, #0
	mov ip, r5
_080137B0:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	cmp r0, #0
	beq _080137E2
	movs r4, #0
	movs r3, #0x1f
	mov r2, ip
	add r2, sb
	lsls r0, r5, #5
	ldr r6, _08013848 @ =0x02022860
	adds r1, r0, r6
_080137CA:
	adds r0, r3, #0
	ldrh r6, [r2]
	ands r0, r6
	muls r0, r7, r0
	asrs r0, r0, #8
	ands r0, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080137CA
_080137E2:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _080137B0
_080137EC:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble _08013850
	ldr r1, _0801384C @ =0xFFFFFF00
	add r8, r1
	movs r5, #0
	mov ip, r5
_080137FC:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	cmp r0, #0
	beq _0801383C
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r7, _08013848 @ =0x02022860
	adds r2, r0, r7
_08013818:
	adds r0, r6, #0
	ldrh r1, [r3]
	ands r0, r1
	subs r1, r6, r0
	mov r7, r8
	muls r7, r1, r7
	adds r1, r7, #0
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013818
_0801383C:
	movs r6, #0x30
	add ip, r6
	adds r5, #1
	cmp r5, #0x1f
	ble _080137FC
	b _08013898
	.align 2, 0
_08013848: .4byte 0x02022860
_0801384C: .4byte 0xFFFFFF00
_08013850:
	movs r5, #0
	movs r6, #0
_08013854:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _08013890
	movs r4, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	mov r0, sb
	adds r2, r6, r0
	lsls r0, r5, #5
	ldr r7, _080138F8 @ =0x02022860
	adds r1, r0, r7
_08013870:
	adds r0, r3, #0
	ldrh r7, [r2]
	ands r0, r7
	mov r7, r8
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	ands r0, r3
	ldrh r7, [r1]
	orrs r0, r7
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013870
_08013890:
	adds r6, #0x30
	adds r5, #1
	cmp r5, #0x1f
	ble _08013854
_08013898:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp]
	cmp r1, r0
	ble _08013900
	ldr r5, _080138FC @ =0xFFFFFF00
	adds r1, r1, r5
	str r1, [sp]
	movs r5, #0
_080138AA:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	adds r7, r5, #1
	cmp r0, #0
	beq _080138F0
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, sb
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, _080138F8 @ =0x02022860
	adds r2, r0, r5
_080138CE:
	adds r0, r6, #0
	ldrh r1, [r3]
	ands r0, r1
	subs r1, r6, r0
	ldr r5, [sp]
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080138CE
_080138F0:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _080138AA
	b _0801394A
	.align 2, 0
_080138F8: .4byte 0x02022860
_080138FC: .4byte 0xFFFFFF00
_08013900:
	movs r5, #0
_08013902:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	adds r7, r5, #1
	cmp r0, #0
	beq _08013944
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r1, sb
	adds r2, r0, r1
	lsls r0, r5, #5
	ldr r5, _08013960 @ =0x02022860
	adds r1, r0, r5
_08013926:
	adds r0, r3, #0
	ldrh r6, [r2]
	ands r0, r6
	ldr r5, [sp]
	muls r0, r5, r0
	asrs r0, r0, #8
	ands r0, r3
	ldrh r6, [r1]
	orrs r0, r6
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013926
_08013944:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _08013902
_0801394A:
	bl EnablePalSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013960: .4byte 0x02022860
