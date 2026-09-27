	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080800B4
sub_080800B4: @ 0x080800B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08080118 @ =0x083FCAC0
	ldr r4, _0808011C @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080120 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080124 @ =0x083FCE2C
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080128 @ =0x02003EFE
	ldr r2, _0808012C @ =0x00007060
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080130 @ =0x08404A60
	bl DisplayTexts
	movs r4, #0
	ldr r1, _08080134 @ =0x0200310C
	ldr r0, [r1, #0xc]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08080172
	adds r7, r1, #0
	mov r8, r4
	movs r6, #0x40
_080800FA:
	ldr r2, [r7, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08080138
	adds r0, r2, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _08080138
	movs r2, #4
	b _0808014A
	.align 2, 0
_08080118: .4byte 0x083FCAC0
_0808011C: .4byte 0x02020140
_08080120: .4byte 0x0200373C
_08080124: .4byte 0x083FCE2C
_08080128: .4byte 0x02003EFE
_0808012C: .4byte 0x00007060
_08080130: .4byte 0x08404A60
_08080134: .4byte 0x0200310C
_08080138:
	ldr r0, [r7, #0xc]
	adds r1, r5, #0
	bl IsItemDisplayUsable
	movs r2, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808014A
	movs r2, #1
_0808014A:
	lsls r0, r4, #3
	ldr r1, _08080244 @ =0x0200319C
	adds r0, r0, r1
	ldr r3, _08080248 @ =0x0200323E
	adds r3, r6, r3
	adds r1, r5, #0
	bl sub_08016668
	movs r0, #2
	add r8, r0
	adds r6, #0x80
	adds r4, #1
	cmp r4, #4
	bgt _08080172
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	add r0, r8
	ldrh r5, [r0]
	cmp r5, #0
	bne _080800FA
_08080172:
	ldr r7, _0808024C @ =0x0200310C
	ldr r0, [r7, #0xc]
	bl GetUnitEquippedWeaponSlot
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	blt _080801AC
	lsls r4, r4, #1
	adds r0, r4, #1
	lsls r0, r0, #6
	ldr r1, _08080250 @ =0x0200325C
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x1f
	bl PutSpecialChar
	adds r0, r4, #2
	lsls r0, r0, #6
	ldr r1, _08080254 @ =0x02003C3E
	adds r0, r0, r1
	ldr r1, _08080258 @ =0x083FCE68
	ldr r2, _0808025C @ =0x00007060
	bl TmApplyTsa_thm
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
_080801AC:
	ldr r6, _08080260 @ =0x0200358C
	ldr r4, _08080264 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x60
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0xe
	adds r1, r4, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x8e
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r5, #0
	bl GetItemRangeString
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0xb8
	bl GetStringTextLen
	movs r1, #0x2f
	subs r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r4, #0
	ldr r0, _08080268 @ =0x00005278
	adds r5, r0, #0
	adds r2, r6, #0
	subs r2, #0x8c
	ldr r1, _0808026C @ =0x00005270
	adds r3, r1, #0
	adds r1, r6, #0
	subs r1, #0x4c
_08080226:
	adds r0, r4, r5
	strh r0, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #7
	ble _08080226
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080244: .4byte 0x0200319C
_08080248: .4byte 0x0200323E
_0808024C: .4byte 0x0200310C
_08080250: .4byte 0x0200325C
_08080254: .4byte 0x02003C3E
_08080258: .4byte 0x083FCE68
_0808025C: .4byte 0x00007060
_08080260: .4byte 0x0200358C
_08080264: .4byte 0x0203A3F0
_08080268: .4byte 0x00005278
_0808026C: .4byte 0x00005270
