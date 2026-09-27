	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemUse
DoItemUse: @ 0x080270FC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ClearUi
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x4a
	cmp r0, #0x35
	bls _0802711A
	b _080272C4
_0802711A:
	lsls r0, r0, #2
	ldr r1, _08027124 @ =_08027128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027124: .4byte _08027128
_08027128: @ jump table
	.4byte _08027200 @ case 0
	.4byte _08027200 @ case 1
	.4byte _08027200 @ case 2
	.4byte _08027208 @ case 3
	.4byte _0802727C @ case 4
	.4byte _08027228 @ case 5
	.4byte _08027238 @ case 6
	.4byte _08027240 @ case 7
	.4byte _08027248 @ case 8
	.4byte _0802726C @ case 9
	.4byte _08027218 @ case 10
	.4byte _080272A8 @ case 11
	.4byte _08027274 @ case 12
	.4byte _08027260 @ case 13
	.4byte _08027258 @ case 14
	.4byte _080272C4 @ case 15
	.4byte _080272C4 @ case 16
	.4byte _080272C4 @ case 17
	.4byte _080272C4 @ case 18
	.4byte _080272C4 @ case 19
	.4byte _080272C4 @ case 20
	.4byte _080272C4 @ case 21
	.4byte _080272C4 @ case 22
	.4byte _080272C4 @ case 23
	.4byte _080272C4 @ case 24
	.4byte _080272C4 @ case 25
	.4byte _080272C4 @ case 26
	.4byte _080272C4 @ case 27
	.4byte _080272C4 @ case 28
	.4byte _080272C4 @ case 29
	.4byte _080272C4 @ case 30
	.4byte _080272C4 @ case 31
	.4byte _080272C4 @ case 32
	.4byte _080272C4 @ case 33
	.4byte _080272C4 @ case 34
	.4byte _080272C4 @ case 35
	.4byte _080272C4 @ case 36
	.4byte _080272C4 @ case 37
	.4byte _080272C4 @ case 38
	.4byte _080272C4 @ case 39
	.4byte _080272C4 @ case 40
	.4byte _080272C4 @ case 41
	.4byte _080272C4 @ case 42
	.4byte _080272C4 @ case 43
	.4byte _080272C4 @ case 44
	.4byte _080272C4 @ case 45
	.4byte _080272C4 @ case 46
	.4byte _08027284 @ case 47
	.4byte _08027294 @ case 48
	.4byte _080272C4 @ case 49
	.4byte _080272B0 @ case 50
	.4byte _080272B0 @ case 51
	.4byte _080272B0 @ case 52
	.4byte _080272B0 @ case 53
_08027200:
	ldr r1, _08027204 @ =sub_0802458C
	b _0802720A
	.align 2, 0
_08027204: .4byte sub_0802458C
_08027208:
	ldr r1, _08027214 @ =MakeTargetListForRangedHeal
_0802720A:
	adds r0, r5, #0
	bl sub_08027CBC
	b _080272CA
	.align 2, 0
_08027214: .4byte MakeTargetListForRangedHeal
_08027218:
	ldr r1, _08027224 @ =sub_0802474C
	adds r0, r5, #0
	bl DoUseRescueStaff
	b _080272CA
	.align 2, 0
_08027224: .4byte sub_0802474C
_08027228:
	ldr r1, _08027234 @ =sub_0802465C
	adds r0, r5, #0
	bl sub_08027CF8
	b _080272CA
	.align 2, 0
_08027234: .4byte sub_0802465C
_08027238:
	ldr r1, _0802723C @ =sub_08024858
	b _0802724A
	.align 2, 0
_0802723C: .4byte sub_08024858
_08027240:
	ldr r1, _08027244 @ =sub_08024880
	b _0802724A
	.align 2, 0
_08027244: .4byte sub_08024880
_08027248:
	ldr r1, _08027254 @ =sub_080248A8
_0802724A:
	adds r0, r5, #0
	bl sub_08027DD0
	b _080272CA
	.align 2, 0
_08027254: .4byte sub_080248A8
_08027258:
	adds r0, r5, #0
	bl sub_08027D64
	b _080272CA
_08027260:
	ldr r1, _08027268 @ =sub_0802493C
	movs r2, #0xe6
	lsls r2, r2, #3
	b _08027298
	.align 2, 0
_08027268: .4byte sub_0802493C
_0802726C:
	adds r0, r5, #0
	bl sub_080279B8
	b _080272CA
_08027274:
	adds r0, r5, #0
	bl sub_08027AE8
	b _080272CA
_0802727C:
	adds r0, r5, #0
	bl SetStaffUseAction
	b _080272CA
_08027284:
	ldr r1, _0802728C @ =MakeTargetListForDanceRing
	ldr r2, _08027290 @ =0x00000732
	b _08027298
	.align 2, 0
_0802728C: .4byte MakeTargetListForDanceRing
_08027290: .4byte 0x00000732
_08027294:
	ldr r1, _080272A0 @ =MakeTargetListForMine
	ldr r2, _080272A4 @ =0x00000733
_08027298:
	adds r0, r5, #0
	bl sub_08027A30
	b _080272CA
	.align 2, 0
_080272A0: .4byte MakeTargetListForMine
_080272A4: .4byte 0x00000733
_080272A8:
	adds r0, r5, #0
	bl sub_08028010
	b _080272CA
_080272B0:
	ldr r1, _080272BC @ =sub_08024C54
	ldr r2, _080272C0 @ =0x00000734
	adds r0, r5, #0
	bl DoUseSpecialDance
	b _080272CA
	.align 2, 0
_080272BC: .4byte sub_08024C54
_080272C0: .4byte 0x00000734
_080272C4:
	adds r0, r5, #0
	bl sub_08027674
_080272CA:
	pop {r4, r5}
	pop {r0}
	bx r0
