	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AE218
sub_080AE218: @ 0x080AE218
	push {r4, lr}
	adds r4, r0, #0
	bl GenericOptionChangeHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE274
	bl GetOptionMenuLayoutId
	ldr r1, _080AE254 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080AE258 @ =0x08CE583C
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_080AE360
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE25C
	movs r0, #1
	bl FadeBgmOut
	b _080AE274
	.align 2, 0
_080AE254: .4byte 0x08CE5868
_080AE258: .4byte 0x08CE583C
_080AE25C:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AE270
	movs r0, #0x49
	movs r1, #0
	bl StartBgm
	b _080AE274
_080AE270:
	bl StartMapSongBgm
_080AE274:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
