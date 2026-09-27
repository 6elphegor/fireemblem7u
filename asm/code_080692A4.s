	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080692A4
sub_080692A4: @ 0x080692A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _0806933C @ =0x0203E094
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _08069340 @ =0x0203E098
	ldr r0, [r0]
	mov r8, r0
	ldr r6, [r7, #0x5c]
	ldr r0, _08069344 @ =0x081DAFEC
	ldr r5, _08069348 @ =0x02017784
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, _0806934C @ =0x081DB238
	ldr r4, _08069350 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08069354 @ =0x020235E0
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	ldr r1, _08069358 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _0806935C @ =0x081DB334
	ldr r4, _08069360 @ =0x02022880
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08069364 @ =0x081DB354
	ldr r5, _08069368 @ =0x0201A784
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, _0806936C @ =0x06011400
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterDataMove
	ldr r0, _08069370 @ =0x081DB568
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0x50
	strh r0, [r7, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08069374
	mov r1, sb
	b _08069376
	.align 2, 0
_0806933C: .4byte 0x0203E094
_08069340: .4byte 0x0203E098
_08069344: .4byte 0x081DAFEC
_08069348: .4byte 0x02017784
_0806934C: .4byte 0x081DB238
_08069350: .4byte 0x02019784
_08069354: .4byte 0x020235E0
_08069358: .4byte 0x06002000
_0806935C: .4byte 0x081DB334
_08069360: .4byte 0x02022880
_08069364: .4byte 0x081DB354
_08069368: .4byte 0x0201A784
_0806936C: .4byte 0x06011400
_08069370: .4byte 0x081DB568
_08069374:
	mov r1, r8
_08069376:
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	ldr r0, _080693C0 @ =0x08BDB59C
	bl SetFaceConfig
	ldr r0, _080693C4 @ =0x00001042
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xbc
	movs r3, #0x50
	bl StartFace
	ldr r0, _080693C8 @ =0x030041C0
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1, #0x36]
	str r2, [sp, #8]
	ldr r1, _080693CC @ =0x02023C60
	ldr r2, _080693D0 @ =0x01000200
	add r0, sp, #8
	bl CpuFastSet
	adds r0, r7, #0
	bl sub_08068B28
	adds r0, r7, #0
	bl Proc_Break
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080693C0: .4byte 0x08BDB59C
_080693C4: .4byte 0x00001042
_080693C8: .4byte 0x030041C0
_080693CC: .4byte 0x02023C60
_080693D0: .4byte 0x01000200
