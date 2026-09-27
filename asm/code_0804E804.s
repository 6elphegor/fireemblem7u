	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxQuake
NewEfxQuake: @ 0x0804E804
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804E814 @ =0x02017748
	ldr r0, [r0]
	cmp r0, #1
	bne _0804E818
	movs r0, #0
	b _0804E8F4
	.align 2, 0
_0804E814: .4byte 0x02017748
_0804E818:
	ldr r1, _0804E844 @ =0x0201773C
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E848 @ =0x08B9AE1C
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, _0804E84C @ =0x02000000
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi _0804E8E0
	lsls r0, r4, #2
	ldr r1, _0804E850 @ =_0804E854
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E844: .4byte 0x0201773C
_0804E848: .4byte 0x08B9AE1C
_0804E84C: .4byte 0x02000000
_0804E850: .4byte _0804E854
_0804E854: @ jump table
	.4byte _0804E870 @ case 0
	.4byte _0804E880 @ case 1
	.4byte _0804E890 @ case 2
	.4byte _0804E8A0 @ case 3
	.4byte _0804E8B0 @ case 4
	.4byte _0804E8C0 @ case 5
	.4byte _0804E8D0 @ case 6
_0804E870:
	ldr r0, _0804E87C @ =0x081D7F00
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E87C: .4byte 0x081D7F00
_0804E880:
	ldr r0, _0804E88C @ =0x081D7F22
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E88C: .4byte 0x081D7F22
_0804E890:
	ldr r0, _0804E89C @ =0x081D7F6C
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E89C: .4byte 0x081D7F6C
_0804E8A0:
	ldr r0, _0804E8AC @ =0x081D7FB6
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E8AC: .4byte 0x081D7FB6
_0804E8B0:
	ldr r0, _0804E8BC @ =0x081D8000
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E8BC: .4byte 0x081D8000
_0804E8C0:
	ldr r0, _0804E8CC @ =0x081D804A
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _0804E8EA
	.align 2, 0
_0804E8CC: .4byte 0x081D804A
_0804E8D0:
	ldr r0, _0804E8DC @ =0x081D80B4
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _0804E8EA
	.align 2, 0
_0804E8DC: .4byte 0x081D80B4
_0804E8E0:
	ldr r0, _0804E8FC @ =0x081D7F00
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
_0804E8EA:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
_0804E8F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804E8FC: .4byte 0x081D7F00
