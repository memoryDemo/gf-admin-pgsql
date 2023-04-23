package controller

import (
	"context"
	v1 "github.com/memoryDemo/gf-admin-pgsql/api/v1"
	"reflect"
	"testing"
)

func Test_cLogin_MSALLoginSso(t *testing.T) {
	type args struct {
		ctx context.Context
		req *v1.MSALLoginDoReq
	}

	var tests []struct {
		name    string
		args    args
		wantRes v1.MSALLoginDoRes
		wantErr bool
	}

	// 创建一个新的 v1.MSALLoginDoReq 对象
	req := &v1.MSALLoginDoReq{
		Token: "eyJ0eXAiOiJKV1QiLCJub25jZSI6Ikxqb21aQWxPMXNPZWF6ZDZYMEdpVDRiUjAzUW80SXhwRHZFMTNuckMzNEEiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9kODkzNzU2NC0xNzNmLTRkZWYtYWNkZC0zMjQ0NDY3NDY0ZTUvIiwiaWF0IjoxNjgyMjMyNTExLCJuYmYiOjE2ODIyMzI1MTEsImV4cCI6MTY4MjIzNzYyMywiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFYUUFpLzhUQUFBQW85azAzeG00Nk5Kb1BFdm1jOEdlOGEzTk94MkJ0UzJBVGN3UWpHcFh1Zzk0a2RJR1ltNUQrempnU1dMd21lSDhQM0I0V0JaV1BsMGFIMXJ1Mzg3UGhQV25NejNoMTc3QTZ5a3g3a3pXcHp0N3B6SXJkSXp4d0JRclJnRExZS0UzNzJTU1FBMFVIbE01M3FLR0RlcW5zUT09IiwiYWx0c2VjaWQiOiIxOmxpdmUuY29tOjAwMDM0MDAxQjI3NDBEMzYiLCJhbXIiOlsicHdkIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6InZvbHZvLWFkbWluIiwiYXBwaWQiOiI4ZWM2YTZkMS1mNmUxLTRlMjEtOTJkMC1hMTNhNWJlYTJkMDMiLCJhcHBpZGFjciI6IjAiLCJlbWFpbCI6Im1lbW9yeTE5OTJAbGl2ZS5jb20iLCJmYW1pbHlfbmFtZSI6IueuoSIsImdpdmVuX25hbWUiOiLnu4_nuqwiLCJpZHAiOiJsaXZlLmNvbSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjIwNS4xNzguMTgzLjc4IiwibmFtZSI6IueuoSDnu4_nuqwiLCJvaWQiOiI3ZTc1YWMxYi1mYTg5LTQ0YjktOGRhZi05MTllZjUwN2I3ODkiLCJwbGF0ZiI6IjUiLCJwdWlkIjoiMTAwMzIwMDFEOUU3NjI3QyIsInJoIjoiMC5BVlVBWkhXVDJEOFg3MDJzM1RKRVJuUms1UU1BQUFBQUFBQUF3QUFBQUFBQUFBQ0lBRVEuIiwic2NwIjoiZW1haWwgb3BlbmlkIHByb2ZpbGUgVXNlci5SZWFkIiwic2lnbmluX3N0YXRlIjpbImttc2kiXSwic3ViIjoic09aZTgxbmFaTXM3UE1qaGlfZElYaF9JdXdOMW1yd2w2YjdxUmFUc0lTayIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJBUyIsInRpZCI6ImQ4OTM3NTY0LTE3M2YtNGRlZi1hY2RkLTMyNDQ0Njc0NjRlNSIsInVuaXF1ZV9uYW1lIjoibGl2ZS5jb20jbWVtb3J5MTk5MkBsaXZlLmNvbSIsInV0aSI6ImxlLU9KcGdPUEUtODJWOEF1eTlQQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbIjYyZTkwMzk0LTY5ZjUtNDIzNy05MTkwLTAxMjE3NzE0NWUxMCIsImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfc3QiOnsic3ViIjoib0NMSDZvMWViZC1nWjZMUFg1M0xyckg1V1N4MVhZaFVHWnJoVFJzVDJERSJ9LCJ4bXNfdGNkdCI6MTY0NDU0NjQ2OH0.F5KjcvNXXhJfNfsDWf5Jp5kxZg8zJVMwSdx1RWk5wQ3oZTF2PpPnoFB7Fq9SlNsA190AZ6XSM5yIARHmZAk549GgEOl_i8-8ToK9lqg-HtW1spM4e-2GLfuN_Ln7c-SZPzJwfH5G3VbJgntjIvKf6wFlTiLWeShx-KfkJEdGM5x1uvm7vsS4K_8iUaKbg8yfWYIzj0nwSi_80z6l9POYZQfP4D8Vz6RGdkM_YeYbiduh1xiDKrfcq6NHnBpDo2tUoAxH_gjTmxvN3UyU0wqpWxBC9qLfb1SW22PwiL04heSH2xVLBiJheunZ70P5fG2Q1C8sgyVWyuq05kZSy01v8w",
	}

	// 将新的对象和其它参数一起传递给 MSALLoginSso 函数
	tests = append(tests, struct {
		name    string
		args    args
		wantRes v1.MSALLoginDoRes
		wantErr bool
	}{
		name: "test case 1",
		args: args{
			ctx: context.Background(),
			req: req,
		},
		wantRes: v1.MSALLoginDoRes{
			// 设置 wantRes 的属性...
		},
		wantErr: false,
	})

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			c := &cLogin{}
			gotRes, err := c.MSALLoginSso(tt.args.ctx, tt.args.req)
			if (err != nil) != tt.wantErr {
				t.Errorf("MSALLoginSso() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if !reflect.DeepEqual(gotRes, tt.wantRes) {
				t.Errorf("MSALLoginSso() gotRes = %v, want %v", gotRes, tt.wantRes)
			}
		})
	}
}
