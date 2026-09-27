	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuPutChapterTitle
SaveMenuPutChapterTitle: @ 0x080A35DC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xac
	lsls r0, r0, #4
	bl PutChapterTitleBG
	movs r4, #0
	ldr r6, _080A360C @ =0x0001FFFF
	movs r5, #0xb4
	lsls r5, r5, #9
_080A35F0:
	adds r0, r7, #0
	adds r0, #0x37
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A3610
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	ldrb r1, [r1]
	bl PutChapterTitleGfx
	b _080A361E
	.align 2, 0
_080A360C: .4byte 0x0001FFFF
_080A3610:
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl PutChapterTitleGfx
_080A361E:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #2
	ble _080A35F0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
