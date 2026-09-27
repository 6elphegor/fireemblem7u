	.include "macro.inc"

	.syntax unified

	thumb_func_start InitMainAnims
InitMainAnims: @ 0x08054248
	push {lr}
	ldr r0, _08054260 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _080542C2
	lsls r0, r0, #2
	ldr r1, _08054264 @ =_08054268
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054260: .4byte 0x0203E02C
_08054264: .4byte _08054268
_08054268: @ jump table
	.4byte _0805427C @ case 0
	.4byte _08054286 @ case 1
	.4byte _08054290 @ case 2
	.4byte _0805427C @ case 3
	.4byte _0805427C @ case 4
_0805427C:
	movs r0, #6
	movs r1, #6
	bl InitBattleAnimFrame
	b _080542C2
_08054286:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	b _080542C2
_08054290:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	bl GetBanimInitPosReal
	cmp r0, #0
	bne _080542B4
	ldr r1, _080542B0 @ =0x02000000
	ldr r2, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #0xc]
	b _080542C0
	.align 2, 0
_080542B0: .4byte 0x02000000
_080542B4:
	ldr r1, _080542D0 @ =0x02000000
	ldr r2, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #4]
_080542C0:
	strh r0, [r1, #2]
_080542C2:
	ldr r1, _080542D4 @ =0x0203E05E
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080542D0: .4byte 0x02000000
_080542D4: .4byte 0x0203E05E
