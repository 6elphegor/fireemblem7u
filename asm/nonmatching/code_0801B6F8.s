	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_WeatherIdle
DebugMenu_WeatherIdle: @ 0x0801B6F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0801B738 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801B796
	ldr r0, _0801B73C @ =0x08B9333C
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	adds r0, r5, #0
	adds r1, r6, #0
	bl DebugMenu_WeatherDraw
	ldr r0, [r4, #0x58]
	movs r1, #7
	bl __modsi3
	cmp r0, #6
	bhi _0801B796
	lsls r0, r0, #2
	ldr r1, _0801B740 @ =_0801B744
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B738: .4byte 0x08B857F8
_0801B73C: .4byte 0x08B9333C
_0801B740: .4byte _0801B744
_0801B744: @ jump table
	.4byte _0801B760 @ case 0
	.4byte _0801B768 @ case 1
	.4byte _0801B770 @ case 2
	.4byte _0801B778 @ case 3
	.4byte _0801B780 @ case 4
	.4byte _0801B788 @ case 5
	.4byte _0801B790 @ case 6
_0801B760:
	movs r0, #0
	bl SetWeather
	b _0801B796
_0801B768:
	movs r0, #6
	bl SetWeather
	b _0801B796
_0801B770:
	movs r0, #1
	bl SetWeather
	b _0801B796
_0801B778:
	movs r0, #2
	bl SetWeather
	b _0801B796
_0801B780:
	movs r0, #4
	bl SetWeather
	b _0801B796
_0801B788:
	movs r0, #3
	bl SetWeather
	b _0801B796
_0801B790:
	movs r0, #5
	bl SetWeather
_0801B796:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
