	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPlaySEwithCmdCtrl
EfxPlaySEwithCmdCtrl: @ 0x080677A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	bl GetAnimAnotherSide
	adds r6, r0, #0
	mov r0, r8
	bl GetAISLayerId
	cmp r0, #1
	bne _080677C4
	b _08067B10
_080677C4:
	mov r0, r8
	bl GetAnimPosition
	adds r5, r0, #0
	cmp r5, #0
	bne _080677DC
	ldr r0, _080677D8 @ =0x0203E0D8
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _080677E2
	.align 2, 0
_080677D8: .4byte 0x0203E0D8
_080677DC:
	ldr r0, _0806780C @ =0x0203E0D8
	movs r3, #2
	ldrsh r4, [r0, r3]
_080677E2:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType1FromTerrain
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0x14
	bne _080677FE
	mov r0, r8
	bl IsAnimSoundInPositionMaybe
	cmp r0, #0
	bne _080677FE
	movs r7, #2
_080677FE:
	cmp r5, #0
	bne _08067814
	ldr r0, _08067810 @ =0x0203E0DC
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0806781A
	.align 2, 0
_0806780C: .4byte 0x0203E0D8
_08067810: .4byte 0x0203E0DC
_08067814:
	ldr r0, _08067858 @ =0x0203E0DC
	movs r3, #2
	ldrsh r0, [r0, r3]
_0806781A:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType2FromBaseCon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0806785C @ =0x0000FFFF
	mov r0, r8
	str r2, [sp]
	bl GetProperAnimSoundLocation
	mov r1, r8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	subs r0, #0x19
	ldr r2, [sp]
	cmp r0, #0x37
	bls _0806784C
	b _08067AEA
_0806784C:
	lsls r0, r0, #2
	ldr r1, _08067860 @ =_08067864
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08067858: .4byte 0x0203E0DC
_0806785C: .4byte 0x0000FFFF
_08067860: .4byte _08067864
_08067864: @ jump table
	.4byte _08067944 @ case 0
	.4byte _08067AEA @ case 1
	.4byte _08067A1E @ case 2
	.4byte _08067948 @ case 3
	.4byte _08067950 @ case 4
	.4byte _08067958 @ case 5
	.4byte _08067960 @ case 6
	.4byte _08067980 @ case 7
	.4byte _080679A0 @ case 8
	.4byte _080679E4 @ case 9
	.4byte _080679E8 @ case 10
	.4byte _080679EC @ case 11
	.4byte _080679F0 @ case 12
	.4byte _08067AEA @ case 13
	.4byte _08067AEA @ case 14
	.4byte _080679F8 @ case 15
	.4byte _080679FC @ case 16
	.4byte _08067A04 @ case 17
	.4byte _08067A0A @ case 18
	.4byte _08067AEA @ case 19
	.4byte _08067AEA @ case 20
	.4byte _08067AEA @ case 21
	.4byte _08067A14 @ case 22
	.4byte _08067AEA @ case 23
	.4byte _08067AEA @ case 24
	.4byte _08067AEA @ case 25
	.4byte _08067A1A @ case 26
	.4byte _08067A1E @ case 27
	.4byte _08067A38 @ case 28
	.4byte _08067A48 @ case 29
	.4byte _08067A4C @ case 30
	.4byte _08067A50 @ case 31
	.4byte _08067AEA @ case 32
	.4byte _08067A54 @ case 33
	.4byte _08067A5C @ case 34
	.4byte _08067A62 @ case 35
	.4byte _08067AEA @ case 36
	.4byte _08067A74 @ case 37
	.4byte _08067A78 @ case 38
	.4byte _08067A7E @ case 39
	.4byte _08067A88 @ case 40
	.4byte _08067A8C @ case 41
	.4byte _08067A90 @ case 42
	.4byte _08067A98 @ case 43
	.4byte _08067A9E @ case 44
	.4byte _08067AA8 @ case 45
	.4byte _08067AEA @ case 46
	.4byte _08067AB0 @ case 47
	.4byte _08067AB4 @ case 48
	.4byte _08067ABC @ case 49
	.4byte _08067AC2 @ case 50
	.4byte _08067ACC @ case 51
	.4byte _08067AD4 @ case 52
	.4byte _08067AEA @ case 53
	.4byte _08067ADC @ case 54
	.4byte _08067AE4 @ case 55
_08067944:
	movs r4, #0xd1
	b _08067AEC
_08067948:
	ldr r1, _0806794C @ =0x08BDB344
	b _08067A20
	.align 2, 0
_0806794C: .4byte 0x08BDB344
_08067950:
	ldr r1, _08067954 @ =0x08BDB360
	b _08067A20
	.align 2, 0
_08067954: .4byte 0x08BDB360
_08067958:
	ldr r1, _0806795C @ =0x08BDB37C
	b _08067A20
	.align 2, 0
_0806795C: .4byte 0x08BDB37C
_08067960:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080679C8
	cmp r0, #1
	bgt _080679BE
	cmp r0, #0
	bne _080679CE
	movs r4, #0xd2
	b _080679CE
_08067980:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080679C8
	cmp r0, #1
	bgt _080679BE
	cmp r0, #0
	bne _080679CE
	movs r4, #0xd3
	b _080679CE
_080679A0:
	adds r0, r6, #0
	bl EfxPlayCriticalHittedSFX
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080679C8
	cmp r0, #1
	bgt _080679BE
	cmp r0, #0
	beq _080679C4
	b _080679CE
_080679BE:
	cmp r0, #2
	beq _080679CC
	b _080679CE
_080679C4:
	movs r4, #0xd4
	b _080679CE
_080679C8:
	movs r4, #0xd5
	b _080679CE
_080679CC:
	ldr r4, _080679E0 @ =0x000002CE
_080679CE:
	adds r0, r6, #0
	bl GetProperAnimSoundLocation
	ldrh r6, [r6, #2]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _08067AEC
	.align 2, 0
_080679E0: .4byte 0x000002CE
_080679E4:
	movs r4, #0xc9
	b _08067AEC
_080679E8:
	movs r4, #0xc8
	b _08067AEC
_080679EC:
	movs r4, #0xca
	b _08067AEC
_080679F0:
	ldr r4, _080679F4 @ =0x00000263
	b _08067A3A
	.align 2, 0
_080679F4: .4byte 0x00000263
_080679F8:
	movs r4, #0xf6
	b _08067AEC
_080679FC:
	ldr r4, _08067A00 @ =0x00000141
	b _08067AEC
	.align 2, 0
_08067A00: .4byte 0x00000141
_08067A04:
	movs r4, #0xa1
	lsls r4, r4, #1
	b _08067AEC
_08067A0A:
	ldr r4, _08067A10 @ =0x00000267
	b _08067A3A
	.align 2, 0
_08067A10: .4byte 0x00000267
_08067A14:
	movs r4, #0xbe
	lsls r4, r4, #2
	b _08067AEC
_08067A1A:
	movs r4, #0xe7
	b _08067AEC
_08067A1E:
	ldr r1, _08067A34 @ =0x08BDB328
_08067A20:
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	b _08067AEC
	.align 2, 0
_08067A34: .4byte 0x08BDB328
_08067A38:
	ldr r4, _08067A44 @ =0x00000265
_08067A3A:
	cmp r5, #0
	bne _08067AEC
	subs r4, #1
	b _08067AEC
	.align 2, 0
_08067A44: .4byte 0x00000265
_08067A48:
	movs r4, #0xce
	b _08067AEC
_08067A4C:
	movs r4, #0xcf
	b _08067AEC
_08067A50:
	movs r4, #0xcb
	b _08067AEC
_08067A54:
	ldr r4, _08067A58 @ =0x000002D3
	b _08067AEC
	.align 2, 0
_08067A58: .4byte 0x000002D3
_08067A5C:
	movs r4, #0xb5
	lsls r4, r4, #2
	b _08067AEC
_08067A62:
	ldr r4, _08067A70 @ =0x00000263
	cmp r5, #0
	bne _08067A6A
	subs r4, #1
_08067A6A:
	movs r1, #0x80
	mov r8, r1
	b _08067AEC
	.align 2, 0
_08067A70: .4byte 0x00000263
_08067A74:
	movs r4, #0xf1
	b _08067AEC
_08067A78:
	movs r4, #0x9b
	lsls r4, r4, #1
	b _08067AEC
_08067A7E:
	ldr r4, _08067A84 @ =0x00000117
	b _08067AEC
	.align 2, 0
_08067A84: .4byte 0x00000117
_08067A88:
	movs r4, #0xeb
	b _08067AEC
_08067A8C:
	movs r4, #0xea
	b _08067AEC
_08067A90:
	ldr r4, _08067A94 @ =0x000002CF
	b _08067AEC
	.align 2, 0
_08067A94: .4byte 0x000002CF
_08067A98:
	movs r4, #0xb4
	lsls r4, r4, #2
	b _08067AEC
_08067A9E:
	ldr r4, _08067AA4 @ =0x000002D1
	b _08067AEC
	.align 2, 0
_08067AA4: .4byte 0x000002D1
_08067AA8:
	ldr r4, _08067AAC @ =0x000002D2
	b _08067AEC
	.align 2, 0
_08067AAC: .4byte 0x000002D2
_08067AB0:
	movs r4, #0xed
	b _08067AEC
_08067AB4:
	ldr r4, _08067AB8 @ =0x00000135
	b _08067AEC
	.align 2, 0
_08067AB8: .4byte 0x00000135
_08067ABC:
	movs r4, #0x9a
	lsls r4, r4, #1
	b _08067AEC
_08067AC2:
	ldr r4, _08067AC8 @ =0x000002DD
	b _08067AEC
	.align 2, 0
_08067AC8: .4byte 0x000002DD
_08067ACC:
	ldr r4, _08067AD0 @ =0x000002DE
	b _08067AEC
	.align 2, 0
_08067AD0: .4byte 0x000002DE
_08067AD4:
	ldr r4, _08067AD8 @ =0x000002DF
	b _08067AEC
	.align 2, 0
_08067AD8: .4byte 0x000002DF
_08067ADC:
	ldr r4, _08067AE0 @ =0x000002F7
	b _08067AEC
	.align 2, 0
_08067AE0: .4byte 0x000002F7
_08067AE4:
	movs r4, #0xba
	lsls r4, r4, #2
	b _08067AEC
_08067AEA:
	movs r4, #0
_08067AEC:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08067B10
	mov r1, r8
	adds r0, r4, #0
	str r3, [sp, #4]
	bl EfxPlaySE
	ldr r3, [sp, #4]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	adds r0, r4, #0
	bl M4aPlayWithPostionCtrl
_08067B10:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
