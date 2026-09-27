	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080838FC
sub_080838FC: @ 0x080838FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	str r1, [sp, #4]
	adds r4, r2, #0
	mov r8, r3
	cmp r4, #0x1f
	bgt _08083916
	movs r4, #0x20
_08083916:
	cmp r4, #0xc0
	ble _0808391C
	movs r4, #0xc0
_0808391C:
	mov r0, r8
	cmp r0, #0xf
	bgt _08083926
	movs r1, #0x10
	mov r8, r1
_08083926:
	mov r2, r8
	cmp r2, #0x50
	ble _08083930
	movs r3, #0x50
	mov r8, r3
_08083930:
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808393E
	b _08083B90
_0808393E:
	mov r0, r8
	adds r0, #0xf
	cmp r0, #0
	bge _08083948
	adds r0, #0xf
_08083948:
	asrs r0, r0, #4
	str r0, [sp, #0xc]
	adds r0, r4, #7
	cmp r0, #0
	bge _08083954
	adds r0, #7
_08083954:
	asrs r0, r0, #3
	adds r1, r0, #1
	str r1, [sp, #8]
	movs r6, #0
	subs r0, #3
	ldr r2, [sp, #4]
	subs r2, #8
	str r2, [sp, #0x14]
	ldr r3, [sp, #4]
	add r3, r8
	str r3, [sp, #0x20]
	mov r1, sb
	subs r1, #8
	str r1, [sp, #0x10]
	cmp r6, r0
	bge _080839BA
	str r0, [sp, #0x18]
_08083976:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #4
	cmp r5, #0
	blt _080839B2
	ldr r2, _08083B60 @ =0x0203E734
	mov sl, r2
_08083984:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808398E
	mov r0, r8
_0808398E:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08083B64 @ =0x08B905F8
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08083984
_080839B2:
	adds r6, r4, #0
	ldr r0, [sp, #0x18]
	cmp r6, r0
	blt _08083976
_080839BA:
	ldr r1, [sp, #8]
	subs r1, #2
	str r1, [sp, #0x1c]
	cmp r6, r1
	bge _08083A08
_080839C4:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #2
	cmp r5, #0
	blt _08083A00
	ldr r2, _08083B60 @ =0x0203E734
	mov sl, r2
_080839D2:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _080839DC
	mov r0, r8
_080839DC:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08083B68 @ =0x08B905B8
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080839D2
_08083A00:
	adds r6, r4, #0
	ldr r0, [sp, #0x1c]
	cmp r6, r0
	blt _080839C4
_08083A08:
	ldr r1, [sp, #8]
	cmp r6, r1
	bge _08083A52
_08083A0E:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #1
	cmp r5, #0
	blt _08083A4A
	ldr r2, _08083B60 @ =0x0203E734
	mov sl, r2
_08083A1C:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08083A26
	mov r0, r8
_08083A26:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08083B6C @ =0x08B905D0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08083A1C
_08083A4A:
	adds r6, r4, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	blt _08083A0E
_08083A52:
	movs r6, #0
	ldr r1, [sp, #0x1c]
	cmp r6, r1
	bge _08083A8C
	ldr r5, _08083B60 @ =0x0203E734
	mov r4, sb
_08083A5E:
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _08083B70 @ =0x08B905E8
	bl PutSprite
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	ldr r3, _08083B74 @ =0x08B905F0
	bl PutSprite
	adds r4, #0x10
	adds r6, #2
	ldr r2, [sp, #0x1c]
	cmp r6, r2
	blt _08083A5E
_08083A8C:
	ldr r3, [sp, #8]
	cmp r6, r3
	bge _08083AC8
	ldr r5, _08083B60 @ =0x0203E734
	lsls r0, r6, #3
	mov r1, sb
	adds r4, r0, r1
_08083A9A:
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _08083B78 @ =0x08B905B0
	bl PutSprite
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	ldr r3, _08083B7C @ =0x08B90630
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r2, [sp, #8]
	cmp r6, r2
	blt _08083A9A
_08083AC8:
	ldr r5, [sp, #0xc]
	lsls r6, r6, #3
	cmp r5, #0
	blt _08083B0E
	ldr r7, _08083B60 @ =0x0203E734
_08083AD2:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08083ADC
	mov r0, r8
_08083ADC:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r4, r3, r0
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, _08083B6C @ =0x08B905D0
	bl PutSprite
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	mov r2, sb
	adds r1, r2, r6
	adds r2, r4, #0
	ldr r3, _08083B80 @ =0x08B90620
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08083AD2
_08083B0E:
	ldr r3, _08083B78 @ =0x08B905B0
	ldr r4, _08083B84 @ =0x0203E6F4
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl PutSprite
	mov r3, sb
	adds r5, r3, r6
	ldr r3, _08083B88 @ =0x08B90628
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _08083B7C @ =0x08B90630
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	bl PutSprite
	ldr r3, _08083B8C @ =0x08B90638
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	ldr r2, [sp, #0x20]
	bl PutSprite
	b _08083BF2
	.align 2, 0
_08083B60: .4byte 0x0203E734
_08083B64: .4byte 0x08B905F8
_08083B68: .4byte 0x08B905B8
_08083B6C: .4byte 0x08B905D0
_08083B70: .4byte 0x08B905E8
_08083B74: .4byte 0x08B905F0
_08083B78: .4byte 0x08B905B0
_08083B7C: .4byte 0x08B90630
_08083B80: .4byte 0x08B90620
_08083B84: .4byte 0x0203E6F4
_08083B88: .4byte 0x08B90628
_08083B8C: .4byte 0x08B90638
_08083B90:
	adds r0, r4, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _08083B9A
	adds r0, #0x1f
_08083B9A:
	asrs r0, r0, #5
	str r0, [sp, #8]
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	subs r0, #1
	str r0, [sp, #0xc]
	ldr r6, [sp, #8]
	subs r6, #1
	cmp r6, #0
	blt _08083BF2
_08083BB2:
	ldr r5, [sp, #0xc]
	subs r0, r6, #1
	mov r8, r0
	cmp r5, #0
	blt _08083BEC
	lsls r7, r6, #5
	ldr r1, _08083C04 @ =0x0203E734
	mov sl, r1
	lsls r0, r5, #4
	ldr r2, [sp, #4]
	adds r4, r0, r2
_08083BC8:
	lsls r0, r6, #2
	mov r3, sl
	ldrh r3, [r3]
	adds r0, r3, r0
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r2, sb
	adds r1, r2, r7
	adds r2, r4, #0
	ldr r3, _08083C08 @ =0x08B905F8
	bl PutSprite
	subs r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _08083BC8
_08083BEC:
	mov r6, r8
	cmp r6, #0
	bge _08083BB2
_08083BF2:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083C04: .4byte 0x0203E734
_08083C08: .4byte 0x08B905F8
