	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrGauge
NewEkrGauge: @ 0x0804C1D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _0804C21C @ =0x02000068
	ldr r0, _0804C220 @ =0x08B9A9FC
	movs r1, #1
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	bl EkrGauge_0804CC68
	bl EkrGauge_0804CC28
	bl DisableEkrGauge
	bl EkrGauge_ClrInitFlag
	ldr r1, _0804C224 @ =0x02000038
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl EkrGauge_0804CC78
	ldr r0, _0804C228 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804C234
	ldr r0, _0804C22C @ =0x081D9730
	ldr r1, _0804C230 @ =0x02022BC0
	movs r2, #0x10
	bl CpuSet
	b _0804C248
	.align 2, 0
_0804C21C: .4byte 0x02000068
_0804C220: .4byte 0x08B9A9FC
_0804C224: .4byte 0x02000038
_0804C228: .4byte 0x0203E0B8
_0804C22C: .4byte 0x081D9730
_0804C230: .4byte 0x02022BC0
_0804C234:
	ldr r0, _0804C260 @ =0x0203E020
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804C264 @ =0x081D95B0
	adds r0, r0, r1
	ldr r1, _0804C268 @ =0x02022BC0
	movs r2, #0x10
	bl CpuSet
_0804C248:
	ldr r0, _0804C26C @ =0x0203E0B8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804C278
	ldr r0, _0804C270 @ =0x081D9730
	ldr r1, _0804C274 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
	b _0804C28C
	.align 2, 0
_0804C260: .4byte 0x0203E020
_0804C264: .4byte 0x081D95B0
_0804C268: .4byte 0x02022BC0
_0804C26C: .4byte 0x0203E0B8
_0804C270: .4byte 0x081D9730
_0804C274: .4byte 0x02022BE0
_0804C278:
	ldr r0, _0804C3DC @ =0x0203E020
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804C3E0 @ =0x081D95B0
	adds r0, r0, r1
	ldr r1, _0804C3E4 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
_0804C28C:
	ldr r1, _0804C3E8 @ =0x0203E0C0
	ldr r2, _0804C3EC @ =0x0000FFFF
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r2, r0
	strh r2, [r1]
	ldrh r2, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldr r0, _0804C3F0 @ =0x081D9020
	ldr r1, _0804C3F4 @ =0x06013800
	bl LZ77UnCompVram
	ldr r0, _0804C3F8 @ =0x081D90C0
	ldr r1, _0804C3FC @ =0x06013C00
	bl LZ77UnCompVram
	ldr r6, _0804C3DC @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804C400 @ =0x081D9330
	adds r0, r0, r5
	ldr r4, _0804C404 @ =0x02022B00
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r6, _0804C408 @ =0x0203E0C4
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, _0804C40C @ =0x02017700
	adds r1, r7, #0
	bl sub_0804C168
	ldr r5, _0804C410 @ =0x0203E0C8
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl sub_0804C168
	ldr r4, _0804C414 @ =0x0203E0CC
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl sub_0804C168
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl sub_0804C168
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl sub_0804C168
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl sub_0804C168
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804C418 @ =0x020169C8
	ldr r2, _0804C41C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	movs r6, #0
	mov sb, r7
_0804C338:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
_0804C342:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _0804C420 @ =0x081D9170
	adds r0, r0, r1
	ldr r7, _0804C418 @ =0x020169C8
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl CpuSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls _0804C342
	mov r6, r8
	cmp r6, #5
	bls _0804C338
	ldr r1, _0804C424 @ =0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterDataMove
	adds r0, r7, r4
	ldr r1, _0804C428 @ =0x06013E00
	adds r2, r4, #0
	bl RegisterDataMove
	bl InitIcons
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, _0804C42C @ =0x0203E094
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xee
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804C430 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xef
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804C434 @ =0x0819431C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C3DC: .4byte 0x0203E020
_0804C3E0: .4byte 0x081D95B0
_0804C3E4: .4byte 0x02022BE0
_0804C3E8: .4byte 0x0203E0C0
_0804C3EC: .4byte 0x0000FFFF
_0804C3F0: .4byte 0x081D9020
_0804C3F4: .4byte 0x06013800
_0804C3F8: .4byte 0x081D90C0
_0804C3FC: .4byte 0x06013C00
_0804C400: .4byte 0x081D9330
_0804C404: .4byte 0x02022B00
_0804C408: .4byte 0x0203E0C4
_0804C40C: .4byte 0x02017700
_0804C410: .4byte 0x0203E0C8
_0804C414: .4byte 0x0203E0CC
_0804C418: .4byte 0x020169C8
_0804C41C: .4byte 0x01000100
_0804C420: .4byte 0x081D9170
_0804C424: .4byte 0x06013A00
_0804C428: .4byte 0x06013E00
_0804C42C: .4byte 0x0203E094
_0804C430: .4byte 0x0203E098
_0804C434: .4byte 0x0819431C
