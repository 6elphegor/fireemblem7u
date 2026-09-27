	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfoFx_Thread
TactInfoFx_Thread: @ 0x080A682C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080A6894 @ =0x0000F880
	movs r5, #0x80
	movs r4, #1
_080A6836:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x28
	ldr r3, _080A6898 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6836
	ldr r6, _080A689C @ =0x0000F888
	movs r5, #0x38
	movs r4, #1
_080A6854:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x48
	ldr r3, _080A6898 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6854
	ldr r6, _080A68A0 @ =0x0000F890
	movs r5, #0x90
	movs r4, #1
_080A6872:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x48
	ldr r3, _080A6898 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6872
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6894: .4byte 0x0000F880
_080A6898: .4byte 0x08B905F8
_080A689C: .4byte 0x0000F888
_080A68A0: .4byte 0x0000F890
